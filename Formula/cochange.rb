class Cochange < Formula
  desc "Find code that changes together but lives apart, from Git history"
  homepage "https://github.com/takahirom/cochange"
  url "https://github.com/takahirom/cochange/releases/download/0.5.0/cochange-0.5.0.tar.gz"
  sha256 "9a24f09d6f4a9dbea6fd4d802974b67713e5721bf9d0304942d96f01fdb30f1e"
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
