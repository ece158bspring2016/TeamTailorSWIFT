//
//  ChatViewController.swift
//  FaceMap
//
//  Created by Vu Truong on 6/2/16.
//  Copyright © 2016 Pablo. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {

    //create a child reference with the same connection
    var messageRef: Firebase!
    
    //store the message that we enter as an array
    var messages = [JSQMessage]()
    
    //intatiate the out and incomming message
    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!
    
    //reference to track the user is typing or not
    var userIsTypingRef: Firebase!
    
    var usersTypingQuery: FQuery!
    
    //Store whether the local user is typing in a private property.
    private var localTyping = false
    
    var isTyping: Bool {
        get {
            return localTyping
        }
        set {
            //update userIsTypingRef each time you update this property
            localTyping = newValue
            userIsTypingRef.setValue(newValue)
        }
    }
    
    private func setupBubbles(){
        
        //create the images for the chat bubbles
        let factory = JSQMessagesBubbleImageFactory()
        
        //create the image outgoing and incoming message
        outgoingBubbleImageView = factory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleBlueColor())
        
        incomingBubbleImageView = factory.outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    }
    
    //set up to display message
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
        messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        
        //retrieve message based on NSIndexPath item
        let message = messages[indexPath.item]
        
        //check if the message was sent by the local user. If so, return the outgoing image view.
        if message.senderId == senderId {
            return outgoingBubbleImageView
        } else {
            //If the message was not sent by the local user, return the incoming image view
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!,
        avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        return nil //to remove the avatar
    }
    
    //create a chat message
    func addMessage(id: String, text: String) {
        let message = JSQMessage(senderId: id, displayName: "myUser.Nickname", text: text)
        messages.append(message)
    }
    
    //setup the text color for the incomming user and outgoing user
    override func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        let message = messages[indexPath.item]
        
        if message.senderId == senderId {
            cell.textView!.textColor = UIColor.whiteColor()
        } else {
            cell.textView!.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "FaceMap"
        setupBubbles()
        
        //set the size of the avatar to zero
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
        
        messageRef = ref.childByAppendingPath("message")
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        
        //you create a child reference with a unique key
        let itemRef = messageRef.childByAutoId()
        
        //Create a dictionary to represent the message
        let messageItem = [
            "text": text,
            "senderId": senderId
        ]
        
        //Save the value at the new child location
        itemRef.setValue(messageItem)
        
        //play sound when message sent
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
        //complete send action and reset the input toolbar to empty
        finishSendingMessage()
        
        isTyping = false
    }

    private func observeMessages() {
        //creating a query that limits the synchronization to the last 25 messages
        let messagesQuery = messageRef.queryLimitedToLast(25)
        
        //.ChildAdded event to observe for every child item that has been added, and will be added, at the messages location
        messagesQuery.observeEventType(.ChildAdded) { (snapshot: FDataSnapshot!) in
            //Extract the senderId and text from snapshot.value
            let id = snapshot.value["senderId"] as! String
            let text = snapshot.value["text"] as! String
            
            //addMessage() to add the new message to the data source
            self.addMessage(id, text: text)
            
            //Inform JSQMessagesViewController that a message has been received
            self.finishReceivingMessage()
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        observeMessages()
        observeTyping()
    }
    
    override func textViewDidChange(textView: UITextView) {
        super.textViewDidChange(textView)
        // If the text is not empty, the user is typing
        print(textView.text != "")
        isTyping = textView.text != ""
    }
    
    private func observeTyping() {
        let typingIndicatorRef = ref.childByAppendingPath("typingIndicator")
        userIsTypingRef = typingIndicatorRef.childByAppendingPath(senderId)
        userIsTypingRef.onDisconnectRemoveValue()
        
        //initialize the query by retrieving all users who are typing
        usersTypingQuery = typingIndicatorRef.queryOrderedByValue().queryEqualToValue(true)
        
        //update anytime anything changes in (.value)
        usersTypingQuery.observeEventType(.Value) { (data: FDataSnapshot!) in
            
            //You're the only typing, don't show the indicator
            if data.childrenCount == 1 && self.isTyping {
                return
            }
            
            //Are there others typing?
            self.showTypingIndicator = data.childrenCount > 0
            self.scrollToBottomAnimated(true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
