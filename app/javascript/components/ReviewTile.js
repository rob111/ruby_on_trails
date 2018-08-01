import React, { Component } from 'react'
import VoteButton from '../components/VoteButton';

const ReviewTile = props => {
  if (props.commentbody) {
    Comment = "Comment:"
  }

    return (
      <div>
        <div className="panel-non-link">
          <div id="review_username">
            Username: {props.username}
          </div>
          <div id="review_rating">
            Rating: {props.rating}
          </div>
          <div id="review_comment">
            {Comment} {props.commentbody}
          </div>
        </div>
        <div id="review_rating">
          Rating: {props.rating}
        </div>
        <div id="review_comment">
          {Comment} {props.commentbody}
        </div>
          {props.editReviewLink}
        <div>
          <VoteButton
            likes={props.likes}
            currentUser={props.currentUser}
            reviewId={props.id}
            voteCount={props.voteCount}
            />
        </div>
        <hr />
      </div>
    )
  }

export default ReviewTile;
