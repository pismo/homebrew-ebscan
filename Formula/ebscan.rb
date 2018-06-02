class Ebscan < Formula
  desc "manipulates Elasticbeanstalk environmnet variables for all environments at once."
  homepage "https://github.com/pismo/homebrew-ebscan/"
  url "https://github.com/pismo/homebrew-ebscan/releases/download/v0.1.1/homebrew-ebscan_0.1.1_macOS_64-bit.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.1"
  sha256 "e87d9a290ce9736bae6f47868021c08410f8c5fe18ff5b4aa5ea44956bd6a7e5"
  
  depends_on "awsebcli"

  def install
    bin.install "ebscan"
  end

  def caveats; <<~EOS
    ebscan -contains `substring-in-env-var`
  EOS
  end
end
