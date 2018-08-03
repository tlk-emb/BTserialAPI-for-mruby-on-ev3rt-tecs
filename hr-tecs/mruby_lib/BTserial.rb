unless $initialized
  module EV3RT_TECS
    class BTserial < TECS::TsBTserial

      private 
      def initialize
        super "BridgeBTserial"
      end
      @@instance = self.new
      public
      def self.read_byte()
        return @@instance.bread()
      end
      def self.send_byte(str)
	buf=TECS::CharPointer.new( str.length + 1 )
	buf.from_s str
	@@instance.bsend(buf)
      end
    end
  end
end # unless $initialized
