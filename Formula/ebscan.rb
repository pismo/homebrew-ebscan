class Ebscan < Formula
  desc "manipulates Elasticbeanstalk environmnet variables for all environments at once."
  homepage "https://github.com/pismo/homebrew-ebscan/"
  url "https://github.com/pismo/homebrew-ebscan/releases/download/v0.1.7/homebrew-ebscan_0.1.7_macOS_64-bit.tar.gz"
  version "0.1.7"
  sha256 "6fe080ddad24c6b3a00e0a8da631cbf4b1c14538790cad54241dcce3e44c91b1"
  
  depends_on "awsebcli"

  def install
    bin.install "homebrew-ebscan"
  end

  def caveats; <<~EOS
    homebrew-ebscan -contains `substring-in-env-var`
  EOS
  end
end
