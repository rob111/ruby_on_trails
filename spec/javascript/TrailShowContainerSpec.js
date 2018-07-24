import TrailShowContainer from '../../app/javascript/containers/TrailShowContainer'
import { mount } from 'enzyme'
import React from 'react'
import fetchMock from 'fetch-mock'

describe('TrailShowContainerSpec', () => {
  let wrapper;
  let trail;
  let user1;

  beforeEach(() => {
    user1 = { email: 'user1@test.com', password: '000000'}
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
        user: user1
    }

    fetchMock.get(`/api/v1/trails/${trail.id}`, {
      status: 200,
      body: trail
    })
    wrapper = mount(<TrailShowContainer params={{id: trail.id}} />)
  });

  afterEach(fetchMock.restore)

  describe('show page', () => {
    it('renders expected page formatting', () => {
        expect(wrapper.find('h2')).toBePresent()

    })

    it('renders expected trail returned from api call', (done) => {
      setTimeout(() => {
        expect(wrapper.find('h2').text()).toEqual(trail.name)
        expect(wrapper.find('#street').text()).toEqual(`Street: ${trail.street}`)
        expect(wrapper.find('#difficulty').text()).toEqual(`Difficulty rating: ${trail.difficulty}`)

        done()

      }, 0)
    })

  })

})
