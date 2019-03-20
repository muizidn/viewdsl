Pod::Spec.new do |spec|

  spec.name         = "ViewDSL"
  spec.version      = "0.0.1"
  spec.summary      = "A DSL way to build UI in Swift"

  spec.description  = <<-DESC
This library helps you build your UI programmatically in fun way!
                   DESC

  spec.homepage     = "https://github.com/muizidn/viewdsl"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Muhammad Muizzsuddin" => "muiz.idn@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/muizidn/viewdsl.git", :tag => "#{spec.version}" }
  spec.source_files  = "ViewDSL/**/*.{h,m,swift}"

end