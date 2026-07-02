class Clijvm < Formula
  desc "AI-friendly JVM profiler CLI built on JDK Flight Recorder"
  homepage "https://github.com/takahirom/cli-jvm"
  url "https://github.com/takahirom/cli-jvm/releases/download/0.5.0/clijvm-0.5.0.tar.gz"
  sha256 "c522e8cbca81d0047a3a83bbbd389ff1e42de3f0334d66d9d034864ba32f9f00"
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
