using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;


namespace Shiny.Push
{
    public class Notification
    {
        public Notification(string message, string? title, IDictionary<string, string>? properties)
        {
            this.Message = message;
            this.Title = title;

            properties ??= new Dictionary<string, string>(0);
            this.AdditionalProperties = new ReadOnlyDictionary<string, string>(properties);
        }


        public string? Title { get; }
        public string Message { get; }
        public IReadOnlyDictionary<string, string> AdditionalProperties { get; }
    }
}

