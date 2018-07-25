import React, { Component } from 'react'

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
      </div>
    )
  }

export default ReviewTile;