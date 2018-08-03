import TrailsIndexContainer from '../../app/javascript/containers/TrailsIndexContainer';
import TrailTile from '../../app/javascript/components/TrailTile';
import { mount } from 'enzyme';
import React from 'react';
import fetchMock from 'fetch-mock';

describe('TrailsIndexContainerSpec', () => {
  let wrapper;
  let trails;
  let user1;

  beforeEach(() => {
    user1 = { email: 'user1@test.com', password: '000000'}
    trails = [
      {
        name: 'Test Trail',
        street: '777 Washington St.',
        city: 'Waltham',
        state: 'MA',
        zip: '12345',
        start_latitude: 1,
        start_longitude: 2,
        length: 4,
        difficulty: 4,
        low_elevation: 23,
        created_by: user1.id,
        photo: {url: 'https://d36gb93zszu20a.cloudfront.net/i/br/fma2.jpg'}
      }
    ]
    fetchMock.get('/api/v1/trails', {
      status: 200,
      body: trails
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
        expect(wrapper.find('.trail-tile').length).toEqual(trails.length)
        expect(wrapper.find('.trail-tile').text()).toEqual(trails[0].name)
        done()
      }, 0)
    })
  })
})
