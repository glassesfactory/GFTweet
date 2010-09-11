/*////////////////////////////////////////////

GFTweet

Autor	YAMAGUCHI EIKICHI
(@glasses_factory)
Date	2010/09/11

Copyright 2010 glasses factory
http://glasses-factory.net

/*////////////////////////////////////////////

package net.glassesfactory.twitter.model.tweet
{
	import mx.skins.halo.ScrollTrackSkin;

	public class GFBasicTweetModel implements IGFTweetModel
	{
		/**
		 * @return	_name	String	名前;
		 * 名前
		 * セッティングでNameの個所に該当するデータ。
		 */
		public function get name():String{	return _name };
		protected var _name:String;
		
		
		/**
		 * @return	_username	String	ID名;
		 * ユーザーネーム。twitter ID。
		 * セッティングでUsernameの個所に該当するデータ。
		 */
		public function get userName():String{	return _userName; }
		protected var _userName:String;
		
		
		/**
		 * @return	_tweet	String	つぶやき本文
		 * つぶやき本文
		 */
		public function get tweet():String{ return _tweet; }
		protected var _tweet:String;
		
		
		/**
		 * @return	_time	つぶやいた日時
		 * つぶやいた日時
		 */
		public function get time():String{	return _time;}
		protected var _time:String
		
		
		
		/**
		 * @return	_statusID	Number つぶやきの固有ID
		 * つぶやきの固有ID
		 */
		public function get statusID():Number{ return _statusID; }
		protected var _statusID:Number;
		
		
		/**
		 * @return	_url	String	URL
		 * URL
		 * ユーザー個別表示画面でWebに該当するデータ。
		 */
		public function get url():String{ return _url; }
		protected var _url:String;
		
		
		/**
		 * @return 	_profileIMGURL	String	アイコンURL
		 * ユーザーアイコン画像のURL
		 */
		public function get iconURL():String{	return _iconURL; }
		protected var _iconURL:String;
		
		/*/////////////////////////////////
		* public methods
		/*/////////////////////////////////
		
		//Constractor
		public function GFBasicTweetModel( name:String, userName:String, tweet:String, time:String,
											statusID:Number, url:String, iconURL:String )
		{
			_name = name;
			_userName = userName;
			_tweet = tweet;
			_time = time;
			_statusID = statusID;
			_url = url;
			_iconURL = iconURL;
		}
		
		
	}
}