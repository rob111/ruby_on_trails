import UserShowContainer from '../../app/javascript/containers/UserShowContainer'
import { mount } from 'enzyme'
import React from 'react'
import fetchMock from 'fetch-mock'

describe('UserShowContainerSpec', () => {
  let wrapper;
  let user1;

  beforeEach(() => {
    user1 = { email: 'user1@test.com', username: 'ben', profile_photo: {url: "/uploads/user/profile_photo/11/sample1_l.jpg"}}

    fetchMock.get(`/api/v1/users/${user1.username}`, {
      status: 200,
      body: {user: user1, review_count: []}
    })
    wrapper = mount(<UserShowContainer params={{id: user1.username}} />)
  });

  afterEach(fetchMock.restore)

  describe('show page', () => {
    it('renders expected page formatting', () => {
        expect(wrapper.find('h2')).toBePresent()
    })

    it('renders expected user profile', (done) => {
      setTimeout(() => {
        expect(wrapper.find('h2').text()).toEqual(user1.username)
        expect(wrapper.find('#email').text()).toEqual(`Email: ${user1.email}`)
        expect(wrapper.find('a').text()).toEqual(`Edit Profile`)
        expect(wrapper.find('img').props().src).toEqual(user1.profile_photo.url)

        done()
      }, 0)
    })

  })

})
