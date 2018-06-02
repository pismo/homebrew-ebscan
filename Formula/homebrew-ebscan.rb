class HomebrewEbscan < Formula
  desc "manipulates Elasticbeanstalk environmnet variables for all environments at once."
  homepage "https://github.com/pismo/homebrew-ebscan/"
  url "https://github.com/pismo/homebrew-ebscan/releases/download/v0.1.2/homebrew-ebscan_0.1.2_macOS_64-bit.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.2"
  sha256 "9c02c0becac4373936969c92daf695b6e8a4ef61f372cc4969f0f596b136ce58"
  
  depends_on "awsebcli"

  def install
    bin.install "homebrew-ebscan"
  end

  def caveats; <<~EOS
    homebrew-ebscan -contains `substring-in-env-var`
  EOS
  end
end
