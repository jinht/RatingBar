Pod::Spec.new do |s|
    
    s.name                       = 'JhtRatingBar'
    s.version                    = '1.0.2'
    s.summary                    = '评分条/星级条'
    s.homepage                   = 'https://github.com/jinht/RatingBar'
    s.license                    = { :type => 'MIT', :file => 'LICENSE' }
    s.author                     = { 'Jinht' => 'jinjob@icloud.com' }
    s.social_media_url           = 'https://blog.csdn.net/Anticipate91'
    s.platform                   = :ios
    s.ios.deployment_target      = '8.0'
    s.source                     = { :git => 'https://github.com/jinht/RatingBar.git', :tag => s.version }
    s.resource                   = 'JhtRatingBar_SDK/JhtStar.bundle'
    s.source_files               = 'JhtRatingBar_SDK/*.*'
    s.frameworks                 = 'UIKit'

end
