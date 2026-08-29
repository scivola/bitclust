# frozen_string_literal: true
require 'test/unit'
require 'bitclust'
require 'bitclust/subcommands/setup_command'

# setup サブコマンドの既定バージョン。
#
# テストリスト:
# [x] 既定の対象バージョンに teeny が付いていない
#     (#%if (version == "V") や #%version V の等値ゲートは文字列一致なので、
#     teeny 付きの版名で DB を作ると doctree CI・生成済みドキュメントと
#     ゲートの判定がずれる)
class TestSetupCommand < Test::Unit::TestCase
  def test_default_versions_have_no_teeny
    versions = BitClust::Subcommands::SetupCommand.new.instance_variable_get(:@versions)
    assert_false(versions.empty?)
    versions.each do |version|
      assert_match(/\A\d+\.\d+\z/, version)
    end
  end
end
