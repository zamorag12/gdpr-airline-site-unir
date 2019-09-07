using Newtonsoft.Json;

namespace GdprAirlineSite.models
{
    [JsonObject]
    public class User
    {
        [JsonProperty(PropertyName = "user_id")]
        public int UserId { get; set; }

        [JsonProperty(PropertyName = "user_name")]
        public string UserName { get; set; }
    }
}