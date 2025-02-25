cask "reinersct-cyberjack" do
  if Hardware::CPU.intel?
    version "3.99.5final.SP13"
    sha256 "25bcd5d5ff197163bba94e72cddb4b74ad8a04df8e88df01404378f80c46f9b4"

    url "https://support.reiner-sct.de/downloads/MAC/pcsc-cyberjack_#{version}-x86_64-signed.pkg"

    livecheck do
      url "https://www.reiner-sct.de/support/support-anfrage/?productGroup=77304735&product=77304820&q=driver&os=macOS"
      regex(/href=.*?pcsc[._-]cyberjack[._-]v?(\d+(?:\.[\dA-z]+)+)[._-]x86[._-]64[._-]signed\.pkg/i)
    end

    pkg "pcsc-cyberjack_#{version}-x86_64-signed.pkg"
  else
    version "3.99.5final.SP14"
    sha256 "16c3628c7bd74617308caafc063517cfa8739d99ce0ea2159be125e1399e344c"

    url "https://support.reiner-sct.de/downloads/MAC/pcsc-cyberjack_#{version}-arm64-signed.pkg"

    livecheck do
      url "https://www.reiner-sct.de/support/support-anfrage/?productGroup=77304735&product=77304820&q=driver&os=macOS"
      regex(/href=.*?pcsc[._-]cyberjack[._-]v?(\d+(?:\.[\dA-z]+)+)[._-]arm64[._-]signed\.pkg/i)
    end

    pkg "pcsc-cyberjack_#{version}-arm64-signed.pkg"
  end

  name "reinersct-cyberjack"
  desc "Driver for smartcard readers by REINER SCT"
  homepage "https://reiner-sct.de/"

  depends_on macos: ">= :high_sierra"

  uninstall pkgutil: "com.reiner-sct.mac.cyberjack"
end
