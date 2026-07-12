class Clijvm < Formula
  desc "AI-friendly JVM profiler CLI built on JDK Flight Recorder"
  homepage "https://github.com/takahirom/cli-jvm"
  url "https://github.com/takahirom/cli-jvm/releases/download/0.6.0/clijvm-0.6.0.tar.gz"
  sha256 "0118143087fcb0bb6836ad89cc84163981bb232eb57973d9add4d87c6220d264"
  license "Apache-2.0"

  # clijvm needs a full JDK (attach API + jcmd), which Homebrew's openjdk provides.
  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env
    (bin/"clijvm").write_env_script libexec/"bin/clijvm", env
  end

  test do
    assert_match "Usage", shell_output("#{bin}/clijvm --help")
  end
end
