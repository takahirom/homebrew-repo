class Clijvm < Formula
  desc "AI-friendly JVM profiler CLI built on JDK Flight Recorder"
  homepage "https://github.com/takahirom/jvm-profiler-cli"
  url "https://github.com/takahirom/jvm-profiler-cli/releases/download/0.1.0/clijvm-0.1.0.tar.gz"
  sha256 "5de9a685225e527973a695c9989aefeccf9ef14a22aa3166d4c001756252e6a0"
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
