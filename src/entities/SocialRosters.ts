import { Column, Entity, Index, JoinColumn, ManyToOne } from "typeorm";
import { SocialGroups } from "./SocialGroups";

@Index("unique_user_friend", ["friendId", "userId"], { unique: true })
@Index("social_roster_pkey", ["id"], { unique: true })
@Entity("social_rosters", { schema: "public" })
export class SocialRosters {
  @Column("bigint", { primary: true, name: "id" })
  id: string;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("bigint", { name: "user_id", unique: true })
  userId: string;

  @Column("bigint", { name: "friend_id", unique: true })
  friendId: string;

  @Column("timestamp without time zone", {
    name: "last_chat_time",
    nullable: true,
  })
  lastChatTime: Date | null;

  @Column("timestamp without time zone", {
    name: "last_read_time",
    nullable: true,
  })
  lastReadTime: Date | null;

  @Column("character varying", { name: "review", nullable: true })
  review: string | null;

  @Column("boolean", { name: "mute_status", default: () => "false" })
  muteStatus: boolean;

  @Column("smallint", { name: "type", nullable: true })
  type: number | null;

  @ManyToOne(() => SocialGroups, (socialGroups) => socialGroups.socialRosters)
  @JoinColumn([{ name: "group_id", referencedColumnName: "id" }])
  group: SocialGroups;
}
