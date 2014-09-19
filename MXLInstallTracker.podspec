Pod::Spec.new do |s|
  s.platform	 		        = :ios
  s.ios.deployment_target = "6.0"

  s.name         = "MXLInstallTracker"
  s.version      = "1.1"
  s.summary      = "Track installs on the major ad networks."

  s.description  = <<-DESC
  					At MobileX Labs we had the issue of wanting robust install tracking and attribution for our apps. This pod will allow you to attribute installs on all major platform with only one line of code.
                   DESC

  s.homepage     = "https://github.com/KiranPanesar/MXLInstallTracker"
  s.license      = "MIT"
  s.author       = { "Kiran Panesar" => "kiran@mobilexlabs.com" }
  s.source       = { :git => "https://github.com/KiranPanesar/MXLInstallTracker.git", :tag => "1.1" }
  s.source_files = "Classes", "MXLInstallTracker/**/*.{h,m}"
  s.vendored_libraries  = "MXLInstallTracker/**/*.a"

  s.requires_arc = true
  s.framework	 = "AdSupport"

  s.dependency "GA-iOS-SDK"
  s.dependency "MobileAppTracker"

end
