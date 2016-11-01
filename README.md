# rails-course

## Ruby 基本语法

### 字符串
```
#代表注释

""       #空字符串
"foo"    #非空字符串
"foo" + "bar"  #字符串拼接 => "foobar"

first_name = "ruo"
"#{first_name} yu"   #=> "ruo yu"

first_name = "ruo"
last_name = "yu"
first_name + " " + last_name   #=> "ruo yu"
"#{first_name} #{last_name}"   #=> "ruo yu"
 
```

### 打印字符串

> puts打印后会换行，print打印后不换行

```
>> puts "foo"
foo
=> nil
```

```
>> print "foo"
foo=> nil
```

```
>> print "foo\n"
foo
=> nil
```

### 单引号字符串
> 单引号字符串展示字面量，不会插值或者转义

```
'foo' + 'bar'   #=> "foobar"
'#{foo} bar'    #=> "\#{foo} bar"
'\n'            #=> "\\n"
```

### 对象和方法

```
"foobar".length  #=> 6
"foobar".empty?  #=> false
"".empty?        #=> true
```

```
nil.nil?        #=> true
"hello world".include?("lo")  #=> true

puts "both are empty" if "".empty? && "".empty?

puts "one is empty" if "".empty? || !"some".empty?

```

### 对象和方法(续)

```
nil.to_s    #=> ""
nil.empty?  #=> error
nil.to_s.empty?   #=> true
!!nil             #=> false
!!0               #=> false
!!""              #=> true
```

```
str = "abcd"
str.reverse       #=> "dcba"
str               #=> "abcd"
str.reverse!      #=> "dcba"
str               #=> "dcba"
```

### 定义方法
> 方法返回值是最后一个语句计算的结果

```
def string_message(str = '')
  if str.empty?
    "字符串是空的"
  else
    "字符串非空"
  end
end

puts string_message("")
puts string_message
puts string_message("hello")
puts string_message "hello"

```

### 数组和值域

```
"foo bar   baz".split   #=> ["foo", "bar", "baz"]
"fooxbarxbazx".split('x')  #=> ["foo", "bar", "baz"]

a = [100, 20, 35]
a.length  #=> 3
a[0]      #=> 100
a[1]      #=> 20
a[2]      #=> 35
a[-1]     #=> 35
a.first   #=> 100
a.second  #=> 20
a.last    #=> 35
a.last == a[-1]    #=> true
```
### 数组和值域（续）
```
a.empty?  #=> false
a.include?(20)  #=> true
a.sort    #=> [20, 35, 100]
a.reverse #=> [35, 20, 100]
a.shuffle  #=> [20, 100, 35]  随机乱序
a         #=> [100, 20, 35]
a.sort!   #=> [20, 35, 100]
a         #=> [20, 35, 100]

```

### 数组和值域（续）

```
a = [3, 1, 9]
a.push(6)   #=> [3, 1, 9, 6]
a << 7      #=> [3, 1, 9, 6, 7]
a << "ruo" << "yu" #=> [3, 1, 9, 6, 7, "ruo", "yu"]
a.join      #=> "31967ruoyu"
a.join(', ')  #=> "3, 1, 9, 6, 7, ruo, yu"
```
### 数组和值域（续）

```
0..4         #=> 0..4
(0..4).to_a  #=> [0, 1, 2, 3, 4] 

a = %w[a b 3 true]  #=> ["a", "b", "3", "true"]
a[0..2]      #=> ["a", "b", "3"]
a[2..-1]     #=> ["3", "true"]
('a'..'f').to_a #=> ["a", "b", "c", "d", "e", "f"]

[2, 3, 4] + [1, 4]  #=> [2, 3, 4, 1, 4]

```

### 块
```
(1..5).each { |i| puts i*i }
```
```
(1..5).each { |i|
  puts i**i
}
```
```
(1..5).each do |i|
  puts i**i
end
```

### 块(2)
```
5.times { puts "hello" }
```
```
5.times {
  puts "hello"
}
```
```
5.times do
  puts "hello"
end
```

### 块(3)
```
(1..5).map {|i| i**2}  => [1, 4, 9, 16, 25]
```
```
%w[a b c].map { |char| char.upcase }
%w[A B C].map(&:downcase)
('a'..'z').to_a.shuffle[0..7].join
```

### 哈希和符号
```
user = {}  #=> {}
user["name"] = "ruoyu"
user["age"] = 28  #=> {"name"=>"ruoyu", "age"=>28}

user2 = { "name" => "ruoyu", "age" => 28}

```
### 哈希和符号（2）
```
user = {:name => "jirengu", :age=> 2}
user[:name]       #=> "jirengu"
user2 = {name: "jirengu", age: 2}
user[:name]       #=> "jirengu"
user == user2     #=> true, 上面两种写法等价

user3 = { "name" => "ruoyu", "age" => 28}
user3 == user     #=> false 上面不等价  "name" != :name

:name.inspect     #=> ":name" ， 返回字面量

user.merge({sex: 'mail'})

```

### 类、对象-构造方法

```
"hello".class  #=> String
:wrold.class   #=> Symbol

s = String.new("ruoyu")  #=> "ruoyu"
s == "ruoyu"             #=> true

h = Hash.new             #=> {}
h[:name]                 #=> nil
h = Hash.new(0)          #=> {}   用于初始化
h[:age]                  #=> 0
```
### 类、对象-构造方法（2）
```
"hello".class    #=> String
"hello".class.superclass  #=> Object
"hello".class.superclass.superclass  #=> BasicObject
"hello".class.superclass.superclass.superclass  #=> nil
```
### 类、对象-构造方法（3）
```
class Word
  def palindrome?(str)
    str == str.reverse
  end
end
w = Word.new
puts w.palindrome?('abcdcba')
```

### 类、对象-构造方法-继承（4）
```
class Word < String
  def palindrome?
    self == self.reverse   # self代表对象本身
    #self == reverse
  end
end
w = Word.new('abcdcba')
puts w.palindrome?
puts w.length
```

### 类、对象-构造方法-修改内置类（4）
```
class String
  def palindrome?
    self == self.reverse   # self代表对象本身
    #self == reverse
  end
end

puts "aba".palindrome?

```
### 类、对象-构造方法
```
class User
    attr_accessor :first, :last
    def initialize(attr = {})
        @first = attr[:first]
        @last = attr[:last]
    end
    def full_name
       "#{@first} #{@last}" 
    end
end
u = User.new(first: 'ruo', last:'yu')
puts u.full_name   #=> "ruoyu"
u.first = 'jirengu'
puts u.full_name   #=> "jirengu yu"
```


























