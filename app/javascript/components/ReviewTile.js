import React, { Component } from 'react'

const ReviewTile = props => {
  if (props.commentbody) {
    Comment = "Comment:"
  }

    return (
      <div>
       <br />
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
        <br />
        <div className="btn-and-link white-link">
          {props.editReviewLink}
        </div>
        <br />
      </div>
    )
  }

export default ReviewTile;
