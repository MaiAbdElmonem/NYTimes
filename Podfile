# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def globalPods
  pod 'SwiftLint', '~> 0.39.2'
end

def globalTestPods
  pod 'RxBlocking', '~> 5.1.1'
  pod 'RxTest', '~>  5.1.1'
end

def kingfisherPod
  pod 'Kingfisher'
end

def swinjectPod
  pod 'Swinject', '~> 2.7.1'
end

target 'NYTimes' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NYTimes
  globalPods
  kingfisherPod
  swinjectPod
  pod 'Moya/RxSwift', '~> 14.0'
  pod 'Shimmer', '~> 1.0.2'
  pod 'RxDataSources', '~> 4.0.1'

  target 'NYTimesTests' do
    inherit! :search_paths
    # Pods for testing
    globalTestPods
  end
end

