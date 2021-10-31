using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;


namespace Shiny.Push
{
    public struct PushNotification
    {
        public PushNotification(IDictionary<string, string> data, Notification? notification)
        {
            this.Data = new ReadOnlyDictionary<string, string>(data);
            this.Notification = notification;
        }


        /// <summary>
        /// This will contain push data if any are received;
        /// </summary>
        public ReadOnlyDictionary<string, string> Data { get; }


        /// <summary>
        /// This will be null if received in the background
        /// </summary>
        public Notification? Notification { get; }
    }
}
