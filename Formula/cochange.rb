class Cochange < Formula
  desc "Find code that changes together but lives apart, from Git history"
  homepage "https://github.com/takahirom/cochange"
  url "https://github.com/takahirom/cochange/releases/download/0.3.0/cochange-0.3.0.tar.gz"
  sha256 "7552e9923d33d900263b5909841c8824b45d5a180639b7b7b7924fcc159da54c"
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
