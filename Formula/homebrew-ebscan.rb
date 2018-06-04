class HomebrewEbscan < Formula
  desc "manipulates Elasticbeanstalk environmnet variables for all environments at once."
  homepage "https://github.com/pismo/homebrew-ebscan/"
  url "https://github.com/pismo/homebrew-ebscan/releases/download/v0.1.8/homebrew-ebscan_0.1.8_macOS_64-bit.tar.gz"
  version "0.1.8"
  sha256 "1a01dfa7e0ecea8a14447091855e8c5e78dede9c428735be8414b21d70aaf941"
  
  depends_on "awsebcli"

  def install
    bin.install "homebrew-ebscan"
  end

  def caveats; <<~EOS
    homebrew-ebscan -contains `substring-in-env-var`
  EOS
  end
end
