class Cochange < Formula
  desc "Find code that changes together but lives apart, from Git history"
  homepage "https://github.com/takahirom/cochange"
  url "https://github.com/takahirom/cochange/releases/download/0.4.0/cochange-0.4.0.tar.gz"
  sha256 "a31f5fa2e398c80490ee6207641697952ba703e7863c89ec71ef6bbc55b6846a"
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
