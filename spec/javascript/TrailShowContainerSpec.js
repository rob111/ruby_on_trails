import TrailShowContainer from '../../app/javascript/containers/TrailShowContainer'
import { mount } from 'enzyme'
import React from 'react'
import fetchMock from 'fetch-mock'

describe('TrailShowContainerSpec', () => {
  let wrapper;
  let trail;
  let user1;
  let reviews;
  let current_user;

  beforeEach(() => {
    user1 = { email: 'user1@test.com', password: '000000', username: 'ben', id: 1},
    trail = {
        name: 'Test Trail',
        street: '777 Washington St.',
        city: 'Waltham',
        state: 'MA',
        zip: 12345,
        start_latitude: 1,
        start_longitude: 2,
        length: 6,
        difficulty: 7,
        elevation: 80,
        user: user1,
        id: 1
    },
  reviews = [
      {
        comment: 'This is a review.',
        rating: 4,
        user: user1.username,
        user_id: user1.id,
        votes: 7,
        id: 1,
        likes: [
          {id: 157,
          user_id: 1,
          vote: "like"}
        ],
      }
    ],
    current_user = {
      id: user1.id,
      admin: false
    }

    fetchMock.get(`/api/v1/trails/${trail.id}`, {
      credentials: 'same-origin',
      status: 200,
      body: {trail: trail, reviews: reviews, current_user: current_user}
    })
    wrapper = mount(<TrailShowContainer params={{id: trail.id}} />)
  });

  afterEach(fetchMock.restore)

  describe('show page', () => {
    it('renders expected page formatting', () => {
        expect(wrapper.find('h2')).toBePresent()
    })

    it('renders expected trail and associated reviews returned from api call', (done) => {
      setTimeout(() => {
        expect(wrapper.find('h2').first().text()).toEqual(trail.name)
        expect(wrapper.find('#street').text()).toEqual(`Street: ${trail.street}`)
        expect(wrapper.find('#difficulty').text()).toEqual(`Difficulty rating: ${trail.difficulty}`)
        expect(wrapper.find('h2').last().text()).toEqual('Reviews')
        expect(wrapper.find('#review_username').text()).toEqual(`Username: ${user1.username}`)
        expect(wrapper.find('#review_rating').text()).toEqual(`Rating: ${reviews[0].rating}`)

        done()
      }, 0)
    })

  })

  describe('show page', () => {

    it('renders expected vote buttons and associated likes returned from api call', (done) => {
      setTimeout(() => {
        expect(wrapper.find('#upvoteContainer').text()).toEqual('Like')
        expect(wrapper.find('#voteCount').text()).toEqual(`${reviews[0]["votes"]} users liked this review`)
        expect(wrapper.find('.selected').text()).toEqual(`Like`)

        done()
      }, 0)
    })

  })

})
