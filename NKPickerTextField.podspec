Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "NKPickerTextField"
s.summary = "NKPickerTextField is just a better UITextField with UIPickerView logic in it."
s.requires_arc = true

# 2
s.version = "0.0.2"

# 3
s.license = "MIT"

# 4 - Replace with your name and e-mail address
s.author = { "Nikolai Kratz" => "nikolai.kratz@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/123okin123/NKPickerTextField"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/123okin123/NKPickerTextField.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "NKPickerTextField/*.{swift}"

end


