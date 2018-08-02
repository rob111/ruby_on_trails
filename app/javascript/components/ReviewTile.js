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
            <span className="review-label">Username:</span> {props.username}
          </div>
          <div id="review_rating">
            <span className="review-label">Rating:</span> {props.rating}
          </div>
          <div id="review_comment">
            <span className="review-label">{Comment}</span> {props.commentbody}
          </div>
          <div className="vote-box">
            <VoteButton
              likes={props.likes}
              currentUser={props.currentUser}
              reviewId={props.id}
              voteCount={props.voteCount}
              />
          </div>
          {props.editReviewLink}
        </div>
      </div>


  )
}

export default ReviewTile;
