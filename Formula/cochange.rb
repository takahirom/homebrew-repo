class Cochange < Formula
  desc "Find code that changes together but lives apart, from Git history"
  homepage "https://github.com/takahirom/cochange"
  url "https://github.com/takahirom/cochange/releases/download/0.1.0/cochange-0.1.0.tar.gz"
  sha256 "38fc05da75da256aa1b15b988e6614160162bb25ce13b6879d86ae298ec5e51b"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env
    (bin/"cochange").write_env_script libexec/"bin/cochange", env
  end

  test do
    assert_match "cochange", shell_output("#{bin}/cochange --help")
  end
end
