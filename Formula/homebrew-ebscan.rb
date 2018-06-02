class HomebrewEbscan < Formula
  desc "manipulates Elasticbeanstalk environmnet variables for all environments at once."
  homepage "https://github.com/pismo/homebrew-ebscan/"
  url "https://github.com/pismo/homebrew-ebscan/releases/download/v0.1.3/homebrew-ebscan_0.1.3_macOS_64-bit.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.3"
  sha256 "d481f3b5df1f67565cefed4914b9e36265a63e4d9de40fe2aa36ba377d1691f3"
  
  depends_on "awsebcli"

  def install
    bin.install "homebrew-ebscan"
  end

  def caveats; <<~EOS
    homebrew-ebscan -contains `substring-in-env-var`
  EOS
  end
end
