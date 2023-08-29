#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickWindow>
#include <QRunnable>
#include <gst/gst.h>

class SetPlaying : public QRunnable {
public:
  SetPlaying(GstElement *);
  ~SetPlaying();

  void run();

private:
  GstElement *pipeline_;
};

SetPlaying::SetPlaying(GstElement *pipeline) {
  this->pipeline_ =
      pipeline ? static_cast<GstElement *>(gst_object_ref(pipeline)) : NULL;
}

SetPlaying::~SetPlaying() {
  if (this->pipeline_)
    gst_object_unref(this->pipeline_);
}

void SetPlaying::run() {
  if (this->pipeline_)
    gst_element_set_state(this->pipeline_, GST_STATE_PLAYING);
}

int main(int argc, char *argv[]) {
  int ret;

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  ret = app.exec();

  return ret;
}
