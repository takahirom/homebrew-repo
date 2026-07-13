class Clijvm < Formula
  desc "AI-friendly JVM profiler CLI built on JDK Flight Recorder"
  homepage "https://github.com/takahirom/cli-jvm"
  url "https://github.com/takahirom/cli-jvm/releases/download/0.7.0/clijvm-0.7.0.tar.gz"
  sha256 "66c6f2679a8c9dcbbcdadbe446698e8de092febaca2e54590a4ba7efb973115d"
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
