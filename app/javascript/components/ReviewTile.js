import React, { Component } from 'react'
import VoteButton from '../components/VoteButton';

const ReviewTile = props => {
  if (props.commentbody) {
    Comment = "Comment:"
  }

    return (
      <div>
        <div id="review_username">
          Username: {props.username}
        </div>
        <div id="review_rating">
          Rating: {props.rating}
        </div>
        <div id="review_comment">
          {Comment} {props.commentbody}
        </div>
        <div className="editReviewLink">
          {props.editReviewLink}
        </div>
        <div>
          <VoteButton
            likes={props.likes}
            currentUser={props.currentUser}
            reviewId={props.id}
            />
        </div>
        <hr />
      </div>
    )
  }

export default ReviewTile;
