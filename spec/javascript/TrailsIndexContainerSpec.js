import TrailsIndexContainer from '../../app/javascript/containers/TrailsIndexContainer';
import TrailTile from '../../app/javascript/components/TrailTile';
import { mount } from 'enzyme';
import React from 'react';
import fetchMock from 'fetch-mock';

describe('TrailsIndexContainerSpec', () => {
  let wrapper;
  let trails_array;
  let user1;

  beforeEach(() => {
    user1 = { email: 'user1@test.com', password: '000000'}
    trails_array = [
      {
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
    ]
    fetchMock.get('/api/v1/trails', {
      status: 200,
      body: trails_array
    })
    wrapper = mount(<TrailsIndexContainer />)
  });

  afterEach(fetchMock.restore)

  describe('listing', () => {
    it('renders an h2', () => {
        expect(wrapper.find('h2')).toBePresent()
    })

    it('renders each trail returned from api call', (done) => {
      setTimeout(() => {
        expect(wrapper.find('li').length).toEqual(trails_array.length)
        expect(wrapper.find('li').text()).toEqual(trails_array[0].name)
        done()
      }, 0)
    })
  })
})
