class Ebscan < Formula
  desc "manipulates Elasticbeanstalk environmnet variables for all environments at once."
  homepage "https://github.com/pismo/ebscan/"
  url "https://github.com/pismo/ebscan/releases/download/v0.1.3/ebscan_0.1.3_macOS_64-bit.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.3"
  sha256 "86e67fb8e6c7772a7c8b0268a61c4636e095cd5301a3482bf66969677c79d62b"
  
  depends_on "awsebcli"

  def install
    bin.install "ebscan"
  end

  def caveats; <<~EOS
    ebscan -contains `substring-in-env-var`
  EOS
  end
end
