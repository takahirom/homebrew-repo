class Cochange < Formula
  desc "Find code that changes together but lives apart, from Git history"
  homepage "https://github.com/takahirom/cochange"
  url "https://github.com/takahirom/cochange/releases/download/0.2.0/cochange-0.2.0.tar.gz"
  sha256 "d3ca923f0bce352d134bb52ea970f3b2a1c4f89e9244189e23790beed1ad38fd"
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
