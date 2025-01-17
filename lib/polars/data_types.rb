module Polars
  # Base class for all Polars data types.
  class DataType
  end

  # 8-bit signed integer type.
  class Int8 < DataType
  end

  # 16-bit signed integer type.
  class Int16 < DataType
  end

  # 32-bit signed integer type.
  class Int32 < DataType
  end

  # 64-bit signed integer type.
  class Int64 < DataType
  end

  # 8-bit unsigned integer type.
  class UInt8 < DataType
  end

  # 16-bit unsigned integer type.
  class UInt16 < DataType
  end

  # 32-bit unsigned integer type.
  class UInt32 < DataType
  end

  # 64-bit unsigned integer type.
  class UInt64 < DataType
  end

  # 32-bit floating point type.
  class Float32 < DataType
  end

  # 64-bit floating point type.
  class Float64 < DataType
  end

  # Boolean type.
  class Boolean < DataType
  end

  # UTF-8 encoded string type.
  class Utf8 < DataType
  end

  # Binary type.
  class Binary < DataType
  end

  # Type representing Null / None values.
  class Null < DataType
  end

  # Type representing Datatype values that could not be determined statically.
  class Unknown < DataType
  end

  # Nested list/array type.
  class List < DataType
    def initialize(inner)
      @inner = Utils.rb_type_to_dtype(inner)
    end
  end

  # Calendar date type.
  class Date < DataType
  end

  # Calendar date and time type.
  class Datetime < DataType
    def initialize(time_unit = "us", time_zone = nil)
      @tu = time_unit || "us"
      @time_zone = time_zone
    end
  end

  # Time duration/delta type.
  class Duration < DataType
    def initialize(time_unit = "us")
      @tu = time_unit
    end
  end

  # Time of day type.
  class Time < DataType
  end

  # Type for wrapping arbitrary Ruby objects.
  class Object < DataType
  end

  # A categorical encoding of a set of strings.
  class Categorical < DataType
  end

  # Definition of a single field within a `Struct` DataType.
  class Field < DataType
    def initialize(name, dtype)
      @name = name
      @dtype = Utils.rb_type_to_dtype(dtype)
    end
  end

  # Struct composite type.
  class Struct < DataType
    def initialize(fields)
      if fields.is_a?(Hash)
        @fields = fields.map { |n, d| Field.new(n, d) }
      else
        @fields = fields
      end
    end
  end
end
