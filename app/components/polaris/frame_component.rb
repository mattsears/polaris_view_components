module Polaris
  class FrameComponent < Polaris::NewComponent
    renders_one :top_bar, ->(**system_arguments) do
      Polaris::Frame::TopBarComponent.new(logo: @logo, **system_arguments)
    end
    renders_one :navigation, ->(**system_arguments) do
      Polaris::NavigationComponent.new(logo: @logo, **system_arguments)
    end
    renders_one :save_bar, ->(**system_arguments) do
      Polaris::Frame::SaveBarComponent.new(logo: @logo, **system_arguments)
    end

    def initialize(logo: nil, **system_arguments)
      @logo = logo && Polaris::Logo.new(**logo)
      @system_arguments = system_arguments
    end

    def system_arguments
      @system_arguments.tap do |opts|
        opts[:tag] = "div"
        opts[:data] ||= {}
        prepend_option(@system_arguments[:data], :controller, "polaris-frame")
        opts[:classes] = class_names(
          opts[:classes],
          "Polaris-Frame",
          "Polaris-Frame--hasNav",
          "Polaris-Frame--hasTopBar"
        )
      end
    end
  end
end
