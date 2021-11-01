using System.Collections.Generic;
using System.Collections.ObjectModel;


namespace Shiny.Push
{
    public class NotificationData
    {
        public NotificationData(string message, string? title, IDictionary<string, string>? props)
        {
            this.Message = message;
            this.Title = title;
            props ??= new Dictionary<string, string>();
            this.AdditionalProperties = new ReadOnlyDictionary<string, string>(props);
        }


        public string Message { get; }
        public string? Title { get; }
        public IReadOnlyDictionary<string, string> AdditionalProperties { get; set; }
    }
}
