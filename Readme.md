# BeforeFieldInit.Fody

[Fody](https://github.com/Fody/Fody) addin.

Forces IL *beforefieldinit* attribute on types decorated with custom BeforeFieldInit attribute.   

## Usage

1. Define custom BeforeFieldInit attribute:

    ```csharp
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Struct, Inherited = false)]
    public class BeforeFieldInitAttribute : Attribute
    {
    }
    ```

2. Add new attribute to your class:

    ```csharp
    [BeforeFieldInit]
    public class MyClass
    {
        static MyClass()
        {
            // Initialization code goes here...
        }
    }
    ```

## Nuget package
   
Coming soon...

## Links

[Introduction to Fody](https://github.com/Fody/Fody/wiki/SampleUsage)  

[C# and beforefieldinit](http://csharpindepth.com/Articles/General/Beforefieldinit.aspx)  

