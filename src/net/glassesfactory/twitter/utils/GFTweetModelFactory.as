/*////////////////////////////////////////////

GFTweet

Autor	YAMAGUCHI EIKICHI
(@glasses_factory)
Date	2010/09/11

Copyright 2010 glasses factory
http://glasses-factory.net

/*////////////////////////////////////////////

package net.glassesfactory.twitter.utils
{
	import net.glassesfactory.twitter.model.profile.GFBasicProfileModel;
	import net.glassesfactory.twitter.model.profile.GFFullProfileModel;
	import net.glassesfactory.twitter.model.profile.IGFProfileModel;
	import net.glassesfactory.twitter.model.tweet.GFBasicTweetModel;
	import net.glassesfactory.twitter.model.tweet.IGFTweetModel;

	/**---------------------------------
	 * モデルを作成し返します。
	 * Factoryと言いつつも全然ファクトリーしてないのは内緒です。
	 *---------------------------------*/
	public class GFTweetModelFactory
	{
		/*/////////////////////////////////
		* public variables
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* getter
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* setter
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* public methods
		/*/////////////////////////////////
		
		//Constractor
		public function GFTweetModelFactory()
		{
		}
		
		
		/**----------------------------
		 * @param 	data	GFTweet.jsからの戻り値
		 * @param	type	作成するプロフィールのタイプ。	@default	basic
		 * 					basic	ユーザー名、ユーザーID、url、アイコンURLのみのシンプルなモデル
		 * 					full	APIからのレスポンスで使うと思われるほとんどのデータをプロパティとして保持するモデル
		 * 	
		 * プロフィールモデルを作成して返します。
		 *---------------------------*/
		public function createProfileModel( data:Object, type:String = "basic" ):IGFProfileModel
		{
			var model:IGFProfileModel;
			switch( type )
			{
				case "basic":
					model = new GFBasicProfileModel( data.name.toString(), data.screenName.toString(), 
														( data.url ) ? data.url.toString() : null, data.profileImageUrl.toString());
					break;
				case "full":
					model = new GFFullProfileModel( data.name.toString(), data.screenName.toString(), 
														( data.url ) ? data.url.toString() : null, data.profileImageUrl.toString(),
														Number(data.id), data.description.toString(), data.location.toString(),
														uint(data.friendsCount), uint(data.followersCount),
														uint(data.statusesCount), data.following );
					break;
				default:throw new Error("オプション指定が間違っています。");
			}
			return model;
		}
		
		
		
		public function createTweetModel( data:Object ):IGFTweetModel
		{
			var model:IGFTweetModel;
			model = new GFBasicTweetModel( data.user.name.toString(), data.user.screenName.toString(), data.text.toString(),
											data.createdAt.toString(), Number(data.id), ( data.user.url ) ? data.user.url.toString() : null,
											data.user.profileImageUrl.toString());
			return model;
		}
		
		
		/*/////////////////////////////////
		* private methods
		/*/////////////////////////////////
		
		
		/*/////////////////////////////////
		* private variables
		/*/////////////////////////////////
		
		
	}
}