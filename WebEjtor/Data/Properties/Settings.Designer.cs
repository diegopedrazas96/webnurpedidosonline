﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "14.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
<<<<<<< HEAD
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=localhost;Initial Catalog=bdTienda;User ID=sa;Password=avatech123*")]
=======
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=VIOCRISIS;Initial Catalog=bdTienda;Integrated Security=True")]
>>>>>>> f4a9c7b909b2a6ecaac2f3ac8660a502433540a8
        public string bdTiendaConnectionString {
            get {
                return ((string)(this["bdTiendaConnectionString"]));
            }
        }
    }
}
