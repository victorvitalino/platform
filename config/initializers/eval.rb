String.class_eval  { include Brb::Calculation }
String.class_eval  { include Brb::Format }
String.class_eval  { include Shared::StringFormat }

Fixnum.class_eval { include CalculateSupport }
