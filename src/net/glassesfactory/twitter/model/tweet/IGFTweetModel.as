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
	public interface IGFTweetModel
	{
		/**
		 * ユーザー名
		 */
		function get name():String;
		
		/**
		 * ユーザーID
		 */
		function get userName():String;
		
		/**
		 * つぶやき
		 */
		function get tweet():String;
		
		/**
		 * つぶやいた日時
		 */
		function get time():String;
		
		/**
		 * つぶやきのID
		 */
		function get statusID():Number;
		
		/**
		 * ユーザーのURL
		 */
		function get url():String;
		
		/**
		 * アイコンURL
		 */
		function get iconURL():String;
	}
}