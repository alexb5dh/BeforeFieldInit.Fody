using System;
using System.Linq;
using Mono.Cecil;

namespace BeforeFieldInit.Fody
{
    public class ModuleWeaver
    {
        const string AttributeSuffix = "Attribute";

        public const string AttributeName = "BeforeFieldInit";

        public ModuleDefinition ModuleDefinition { get; set; }

        public void Execute()
        {
            foreach (var type in ModuleDefinition.Types
                                                 .Where(type => type.CustomAttributes.Any(
                                                     attribute =>
                                                     attribute.AttributeType.Name.Equals(
                                                         AttributeName + AttributeSuffix,
                                                         StringComparison.OrdinalIgnoreCase) ||
                                                     attribute.AttributeType.Name.Equals(
                                                         AttributeName,
                                                         StringComparison.OrdinalIgnoreCase)))
                )
                type.IsBeforeFieldInit = true;
        }
    }
}