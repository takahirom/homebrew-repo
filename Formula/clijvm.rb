class Clijvm < Formula
  desc "AI-friendly JVM profiler CLI built on JDK Flight Recorder"
  homepage "https://github.com/takahirom/jvm-profiler-cli"
  url "https://github.com/takahirom/jvm-profiler-cli/releases/download/0.3.0/clijvm-0.3.0.tar.gz"
  sha256 "0cc26c628750293180c73685bf96f82b87b406d3e30210cdb94b5a96576b1cb3"
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
