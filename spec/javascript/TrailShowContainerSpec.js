import TrailShowContainer from '../../app/javascript/containers/TrailShowContainer'
import { mount } from 'enzyme'
import React from 'react'
import fetchMock from 'fetch-mock'

describe('TrailShowContainerSpec', () => {
  let wrapper;
  let trail;
  let user1;
  let reviews;
  let usernames;

  beforeEach(() => {
    user1 = { email: 'user1@test.com', password: '000000', username: 'ben', id: 1},
    trail = {
        name: 'Test Trail',
        street: '777 Washington St.',
        city: 'Waltham',
        state: 'MA',
        zip: '12345',
        start_latitutde: '1',
        start_longitude: '2',
        length: '6 miles',
        difficulty: '7',
        elevation: '80',
        user: user1,
        id: 1
    },
    reviews = [
      {
        comment: 'This is a review.',
        rating: 4,
        user_id: user1.id,
        trail_id: trail.id,
        id: 1
      }
    ],
    usernames = [
      user1.username
    ]

    fetchMock.get(`/api/v1/trails/${trail.id}`, {
      status: 200,
      body: {trail: trail, reviews: reviews, usernames: usernames}
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
        expect(wrapper.find('h2').last().text()).toEqual('Reviews:')
        expect(wrapper.find('#review_username').text()).toEqual(`Username: ${user1.username}`)
        expect(wrapper.find('#review_rating').text()).toEqual(`Rating: ${reviews[0].rating}`)

        done()
      }, 0)
    })

  })

})
