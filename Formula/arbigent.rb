# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Arbigent < Formula
  desc "Zero to AI agent testing in minutes for Android, iOS, and Web apps. Arbigent's intuitive UI and powerful code interface make it accessible to everyone, while its scenario breakdown feature ensures scalability for even the most complex tasks."
  homepage ""
  url "https://github.com/takahirom/arbigent/releases/download/0.39.0/arbigent-0.39.0.tar.gz"
  sha256 "668291bee3015b4f42f8eae690b5959028d75f73ccadf2533a2da47912bef5fb"
  license "Apache-2.0"

  # depends_on "cmake" => :build

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env
    (bin/"arbigent").write_env_script libexec/"bin/arbigent", env
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test arbigent`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
