class GetPostFeed
  include Interactor
  include CortexHelper

  def call
    begin
      result = cortex.posts.feed(context[:feed_params])
      posts = result.contents
      throw Exception if result.is_error?
      context[:post_feed] = posts
      context[:status] = result.status
    rescue Cortex::Exceptions::ConnectionFailed => e
      context[:error] = "Could not connect to the Cortex at #{e.base_url}"
      context.fail!
    rescue Exception => e
      context[:error] = e.message
      context.fail!
    end
  end
end