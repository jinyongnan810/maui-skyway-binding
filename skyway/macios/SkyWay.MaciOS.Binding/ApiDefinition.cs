using Foundation;

namespace SkyWayMaciOS
{
	// @interface DotnetSkyWay : NSObject
	[BaseType(typeof(NSObject))]
	interface DotnetSkyWay
	{
		[Static]
		[Export("joinWithToken:")]
		void join(string token, string roomId, string userId);

		[Static]
		[Export("join:")]
		void leave();
	}
}
